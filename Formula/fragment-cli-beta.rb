require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3826.0.0-darwin-x64.tar.gz"
    sha256 "ebb6eb6660f6e5bc533d213b240c525afcfba2416046b1944018ac0f529e6663"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3826.0.0-darwin-arm64.tar.gz"
      sha256 "253a6e04ea378ff6a5e5f1821f9c6b679923650aa20b1c1ce4bf363a88962005"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3826.0.0-linux-x64.tar.gz"
    sha256 "747744f5be2eaf3fe038f94a7ce6d8f6159602110b90d0055e096e1b1b14ea92"
  end
  version "3826.0.0"
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
