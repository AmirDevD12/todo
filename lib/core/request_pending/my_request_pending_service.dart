class MyRequestPendingService {
 static final List<Function> _pendingFunction = [];

  static saveRequest(Function request){
    _pendingFunction.add(request);
  }
 static Future<void> retryRequest() async {
   for (int i = _pendingFunction.length - 1; i >= 0; i--) {
       await _pendingFunction[i]();
       _pendingFunction.removeAt(i);
   }

   if (_pendingFunction.isEmpty) {
     print("*** همه درخواست‌ها با موفقیت انجام شدند ***");
   }}


}