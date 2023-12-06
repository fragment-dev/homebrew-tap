require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4106.0.0-darwin-x64.tar.gz"
    sha256 "0d52d1bcc9ae8d2ea5281e4d77d10a7422e6210f991449d6bd7e87ed38c34c08"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4106.0.0-darwin-arm64.tar.gz"
      sha256 "295f0643c568ebd1cd4f8aecf44bf24cb7218e65d9f730aa284be9bfdd462df2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4106.0.0-linux-x64.tar.gz"
    sha256 "d79fb9d52880d5a1cdce4466b43916a70a14343267cb3a2dd704e89b6a778496"
  end
  version "4106.0.0"
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
