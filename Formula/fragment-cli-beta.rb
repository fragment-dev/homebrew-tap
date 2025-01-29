require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6138.0.0-darwin-x64.tar.gz"
    sha256 "9a326d8b135dcda95289bd7313ae4d720f3f07da68df8df32e5ea4483ec1606b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6138.0.0-darwin-arm64.tar.gz"
      sha256 "65921b9ea06a06514eb292d6646c6337a825a4773fae0300ba5fc2ad52e6e05d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6138.0.0-linux-x64.tar.gz"
    sha256 "b4b41f04c4b6390f6c545ad67699e59490c7e288bc471e8cde82973f025017dc"
  end
  version "6138.0.0"
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
