require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2570.0.0-darwin-x64.tar.gz"
    sha256 "99692c14ce6bb4ae968340251541dc5a026f4073194f1fc2340454ff3d6c35d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2570.0.0-darwin-arm64.tar.gz"
      sha256 "01dd02d729eb54f48e1968385f08af00ec92366aebda19e37597f2c223f04a52"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2570.0.0-linux-x64.tar.gz"
    sha256 "4219ecdf34e1171fdd7b88f152bf977be460be412d6427b62f0a80b9f568e460"
  end
  version "2570.0.0"
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
