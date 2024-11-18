require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5781.0.0-darwin-x64.tar.gz"
    sha256 "bfb7307ed6f8d94568559d0549d00f6445e406ba42f5cba4b5c8405de5bf7eda"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5781.0.0-darwin-arm64.tar.gz"
      sha256 "0aeb7935754b389b5173835da847bc9588c77c70130cecf05ba2eb03a7e8c304"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5781.0.0-linux-x64.tar.gz"
    sha256 "c1eae26ace4f38df6eb87c16ac832e244197ac1baefc907351880bac602740c6"
  end
  version "5781.0.0"
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
