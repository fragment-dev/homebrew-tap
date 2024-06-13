require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5274.0.0-darwin-x64.tar.gz"
    sha256 "b14b68a18a8a1b5c040076ed1851084e1755d5aca397cedf2c4f200f3a4e0b78"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5274.0.0-darwin-arm64.tar.gz"
      sha256 "547cfe170bb45e67e0377259fcba8f53c69b0c83810c233994491bf84c13efd1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5274.0.0-linux-x64.tar.gz"
    sha256 "d2973a81cff0077538e72d908c6193a7b28ff09b0f71fb9facf346307533ffc9"
  end
  version "5274.0.0"
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
