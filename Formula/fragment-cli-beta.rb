require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4154.0.0-darwin-x64.tar.gz"
    sha256 "36e6537a8a092f55818208216ed9430e80b5c9b399f03f5dc764a15ab913d927"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4154.0.0-darwin-arm64.tar.gz"
      sha256 "22e5c24bb124814c3627892a24efab0e1bfd4e1014587571e050443a228c508e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4154.0.0-linux-x64.tar.gz"
    sha256 "998fe27419f6975a580f5225a19de2356097b06717c26c2b1d377d9f5ff4c76c"
  end
  version "4154.0.0"
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
