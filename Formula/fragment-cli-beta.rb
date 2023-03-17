require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2238.0.0-darwin-x64.tar.gz"
    sha256 "84a92454bc99e61930f94a2a4caa3d0fc07f605933f0ccc37bd6ca6be9373bc8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2238.0.0-darwin-arm64.tar.gz"
      sha256 "9b733d4f74cd44c5bace250b03748bafb40e0ca6c3966193b94f8a8e9a88118c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2238.0.0-linux-x64.tar.gz"
    sha256 "6f2e837ce4994ebc86ba21080b7b01d59112d0284b51b0b40a401215acb343be"
  end
  version "2238.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
