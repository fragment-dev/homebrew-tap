require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4388.0.0-darwin-x64.tar.gz"
    sha256 "4d35962fbd2ade7d3e735410e1e8f9217ca63e7c468550f1d1d67d20fec66ab5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4388.0.0-darwin-arm64.tar.gz"
      sha256 "7e5e7c82f4a47b0ac0374db31e991576808249cbe68259812b7f0fde44632f2e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4388.0.0-linux-x64.tar.gz"
    sha256 "c82661f7ee96ee3023c307ab1780203761a8044372fdbaabf3d5f30b134f55c2"
  end
  version "4388.0.0"
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
