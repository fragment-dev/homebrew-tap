require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2424.0.0-darwin-x64.tar.gz"
    sha256 "cc433ddba4ff3e2f1f39aefca3ba3db387b7c7658361571b26057e40ff0d65b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2424.0.0-darwin-arm64.tar.gz"
      sha256 "5b4f5a9d5121621202204a4ef8ddb4195ef968f224b2d1c72aad25bfa447c56e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2424.0.0-linux-x64.tar.gz"
    sha256 "a1dfe0961070a7e83168168804939032500578697e59bc2189817d0083c79e53"
  end
  version "2424.0.0"
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
