require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4348.0.0-darwin-x64.tar.gz"
    sha256 "15f082caeb36cb98fb1cc7d266af53be77e2b2bd872d2507301104ea97bc3a32"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4348.0.0-darwin-arm64.tar.gz"
      sha256 "1db803e2e77512d7f0f0af0e26fdfdb24b5e15c667d1d94a635d6bb058b077b6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4348.0.0-linux-x64.tar.gz"
    sha256 "dacce0ef39df8ccaf69c6c62e2f63465d722fe4b430d0a0bb768161a3afd089c"
  end
  version "4348.0.0"
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
