require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3447.0.0-darwin-x64.tar.gz"
    sha256 "2a9b436decbf6fdfafd72b8cb7d7dcf1edea862e79c4128eb785f669c64ef986"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3447.0.0-darwin-arm64.tar.gz"
      sha256 "865870ef7d29d3c1fbb5bb1fdf17849ab0c174a7d888be0303af8b0e8c9bc9e3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3447.0.0-linux-x64.tar.gz"
    sha256 "235d876bbe0bebc3537eb8afc3889dae5744e011ec8aeb858fa243783d7e4012"
  end
  version "3447.0.0"
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
