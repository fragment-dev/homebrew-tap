require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3748.0.0-darwin-x64.tar.gz"
    sha256 "8570ddb30c95481fa74c3ee2fff51c1abd3adb8c1c3ea714a0174c5257174e27"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3748.0.0-darwin-arm64.tar.gz"
      sha256 "892753d654bce6085655179b9e5b67712801b8c10fb4f5040a7ab995534113ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3748.0.0-linux-x64.tar.gz"
    sha256 "7cd1fe18bfcdfb42f868734d08a49b009eca649bd54723ef86e608e7417f649f"
  end
  version "3748.0.0"
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
