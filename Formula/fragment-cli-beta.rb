require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4288.0.0-darwin-x64.tar.gz"
    sha256 "a590473a58f1acbf386d6ffbd571d32c5804ba58e6e3968ad31a9f79515891e1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4288.0.0-darwin-arm64.tar.gz"
      sha256 "e5117b0d3d76085ce63dcb7156835ad444e32d21631e9f9cbb90f7fbd9bbe11d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4288.0.0-linux-x64.tar.gz"
    sha256 "850113add7c4639ac87b47a35072c17850c9d0b49de854fd5c8e4fd1037818de"
  end
  version "4288.0.0"
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
