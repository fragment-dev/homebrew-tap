require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3749.0.0-darwin-x64.tar.gz"
    sha256 "e7aa4d1a207c582a57c4a90a367bff6ed98a55b8ec89f0b6f9bfe4c7bedc668a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3749.0.0-darwin-arm64.tar.gz"
      sha256 "fc0273c53833e60fe9b25eb9ed0d84061ae92ca62793c29b3ce29178cc68b61e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3749.0.0-linux-x64.tar.gz"
    sha256 "ab3976b95906decf901b1c3280c417410e433d490905f5954ff47b7888b495e9"
  end
  version "3749.0.0"
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
