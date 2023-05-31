require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2770.0.0-darwin-x64.tar.gz"
    sha256 "274d25b795986c3dff27718f9e0127bc258601992150e2cee75781b5f66a722e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2770.0.0-darwin-arm64.tar.gz"
      sha256 "11d5c4e8e25201434a748b991bba183f1096f86e3bfc4bf1d49ce0780f54bf36"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2770.0.0-linux-x64.tar.gz"
    sha256 "817a1b525336811911be20bfe9bd7d4284c75b37ba4d8fa38ac0db2c4cfe119f"
  end
  version "2770.0.0"
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
