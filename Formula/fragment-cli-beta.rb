require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5541.0.0-darwin-x64.tar.gz"
    sha256 "99bb8abe550c315cfc082bb1cc6fbc5f1351954863bd990f30685f8bb0eb63ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5541.0.0-darwin-arm64.tar.gz"
      sha256 "d30ad4227f5990f931dd9fb0c5d257dd29809b1494345b740dd578a7efd56cec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5541.0.0-linux-x64.tar.gz"
    sha256 "87b3f86fef592bdd94ed741c4abfb1e667caa90d78ca7ba9bf005c54e225e499"
  end
  version "5541.0.0"
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
