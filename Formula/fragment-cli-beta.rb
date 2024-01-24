require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4418.0.0-darwin-x64.tar.gz"
    sha256 "21602fac123b4c6a2d34fa63b20904e0df221d6c7d9a22f98e296cabfeea3ea2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4418.0.0-darwin-arm64.tar.gz"
      sha256 "e1f91ae84a227a1bc280f49d14604dd1469cd3f4e1e2a3630aae5f3cab710588"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4418.0.0-linux-x64.tar.gz"
    sha256 "f8118d9eb11697ed93ab8415be4de0058f65ee6109a06d34917dd579b6588a3d"
  end
  version "4418.0.0"
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
