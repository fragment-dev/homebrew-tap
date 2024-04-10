require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4870.0.0-darwin-x64.tar.gz"
    sha256 "6c7ff9281ce09b31098fe606b6170273efefd3f09f10a581952c5f6755f60810"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4870.0.0-darwin-arm64.tar.gz"
      sha256 "6456b870264289aaf801270238859c18aa31a4cb50bcb81b27679824790bf54f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4870.0.0-linux-x64.tar.gz"
    sha256 "268819124c91ea0e65d0bf00339494616d068821197b342a0dc72777d413ea4a"
  end
  version "4870.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
