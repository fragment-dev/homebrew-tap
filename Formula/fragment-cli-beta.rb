require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3084.0.0-darwin-x64.tar.gz"
    sha256 "06b7f48913cb3d71d138190d947763b8dc82a2aa15820b0d8316c2ac7fcd436f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3084.0.0-darwin-arm64.tar.gz"
      sha256 "139a94accfec3029079f678fb253e699285dcff4f67ac01b082cc1a06ccf9a52"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3084.0.0-linux-x64.tar.gz"
    sha256 "45b370603051e9465919d9f83a5bfcca9dfd4b0d5eee3479d5c8b39a4ee6611e"
  end
  version "3084.0.0"
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
