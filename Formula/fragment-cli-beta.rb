require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3400.0.0-darwin-x64.tar.gz"
    sha256 "23fe03ce696e0926ccb6eabc0f99b12395097727817885104dbb9978484992cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3400.0.0-darwin-arm64.tar.gz"
      sha256 "710f761961858de62c32bccc69e00a1031a7fc3da845dca4337f361e1a149505"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3400.0.0-linux-x64.tar.gz"
    sha256 "4394e1afad8b41b3de62d4ce2958c14837659f4fdc31d88fb776bcab3a5b7fbb"
  end
  version "3400.0.0"
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
