import 'package:betweener/core/entities/linkes_entity.dart';
import 'package:betweener/core/network/repo/link_repository.dart';
import 'package:betweener/core/providers/auth_providers.dart';
import 'package:betweener/core/providers/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final linksRepoProvider = Provider<LinksRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return LinksRepository(
    apiClient: apiClient,
    networkInfo: networkInfo,
  );
});

final getAllLinksProvider = FutureProvider<void>((ref) async {
  final linksRepo = ref.watch(linksRepoProvider);
  final token = ref.read(appSharedPreferencesProvider.notifier).getAccessToken();
  final result = await linksRepo.getLinks(token);
  result.fold(
    (failure) => null,
    (links) => null,
  );
});

final PostLinksProvider = FutureProvider.family<void, LinkParam>((ref, linksParam) async {
  final linksRepo = ref.watch(linksRepoProvider);
  final result = await linksRepo.postLinks(title: linksParam.title, link: linksParam.link);
  result.fold(
    (failure) => null,
    (links) => null,
  );
});

// final UpdateLinksProvider = FutureProvider.family<LinksEntity, LinkParam>((ref, linksParam) async {
//   final linksRepo = ref.watch(linksRepoProvider);
//   final token = ref.read(appSharedPreferencesProvider.notifier).getAccessToken();
//     // final id = ref.read(appSharedPreferencesProvider.notifier).g();

//   final result = await linksRepo.updateLinks(id, token, linksParam.title, linksParam.link);
//   result.fold(
//     (failure) => null,
//     (links) => null,
//   );
// });

class LinkParam {
  final String title;
  final String link;

  const LinkParam({
    required this.title,
    required this.link,
  });
}
