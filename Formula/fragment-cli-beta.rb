require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3762.0.0-darwin-x64.tar.gz"
    sha256 "d30867f56838d0cc19847f9ff76e67384d8febac7cf83ad421fcb9e8a7b41ec6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3762.0.0-darwin-arm64.tar.gz"
      sha256 "56bef455e351f4fb9f457dcba4aaaee736cb10f675bbc780a53dc0fd66de756c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3762.0.0-linux-x64.tar.gz"
    sha256 "91aea7b0f296859831bf7d3e075ba227d614ab3476fd555c6e1911460a38ace3"
  end
  version "3762.0.0"
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
