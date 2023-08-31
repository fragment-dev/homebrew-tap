require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3453.0.0-darwin-x64.tar.gz"
    sha256 "aab72dba6f59fb56012820c7671f879a4bc1428fb78ae5cd7529c3ff20866184"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3453.0.0-darwin-arm64.tar.gz"
      sha256 "ee24dc3629c239da475f6903cd58139642183d0698ed7076aa10d4e0a67ecd0b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3453.0.0-linux-x64.tar.gz"
    sha256 "a9c45123634cb62a9038e3309df3ea297f9853daeb3e3f4b0d560b09cf8be6f2"
  end
  version "3453.0.0"
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
