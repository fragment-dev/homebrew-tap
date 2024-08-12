require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5496.0.0-darwin-x64.tar.gz"
    sha256 "760f9f098f384f72b6ee48515788fefc56dd4af7274be4a858c5873581caab97"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5496.0.0-darwin-arm64.tar.gz"
      sha256 "75312eecaebf09dacdc78697da6e651a1355027bb4a926aa8943038caa92bc99"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5496.0.0-linux-x64.tar.gz"
    sha256 "fda0b86278b09c2fe1992c9ae360bb38b3a1bfcacd020c02497a42dcee073a3f"
  end
  version "5496.0.0"
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
