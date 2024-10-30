require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5710.0.0-darwin-x64.tar.gz"
    sha256 "0fd8847817688c0241f1e6717495fbbdb8db76b4b49df7876f877fd14bd060b7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5710.0.0-darwin-arm64.tar.gz"
      sha256 "cf02db86001f82fe8c965b2b45c4bfa1ea5784289d9c2147d840db20ac43801a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5710.0.0-linux-x64.tar.gz"
    sha256 "709f145f2f10c2d559bd85f187311e63b9a93af84281d1cb8c8fbb1b425f4c7b"
  end
  version "5710.0.0"
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
