require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3563.0.0-darwin-x64.tar.gz"
    sha256 "faa67e833e4c49b50b79a9fbda47ea21a7354d65081e5d6d9e1c47a4377cea2a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3563.0.0-darwin-arm64.tar.gz"
      sha256 "8db5c063ccdca86495b0f3268fb2bc6449b829affc6a54f3f2cbb31665a66519"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3563.0.0-linux-x64.tar.gz"
    sha256 "330c0931e483a1782f6ec9654bf4809213459b721cf5495819a42bf46b771b83"
  end
  version "3563.0.0"
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
