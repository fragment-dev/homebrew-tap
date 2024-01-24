require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4416.0.0-darwin-x64.tar.gz"
    sha256 "b12dba7b8b3b83f049b18322ba0c613bbebcde8bd6d18475641d2a490ccf8d57"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4416.0.0-darwin-arm64.tar.gz"
      sha256 "cf06acf77a3774d1ab3a80c53657a3384304f05df870971bb02fd7e191c43466"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4416.0.0-linux-x64.tar.gz"
    sha256 "ac5cbfcab380e7b04557f092402756966fd4fcfc14003e4c0896f5b7c50362b6"
  end
  version "4416.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
