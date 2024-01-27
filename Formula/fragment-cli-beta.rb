require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4449.0.0-darwin-x64.tar.gz"
    sha256 "5bb2d5ab2209217d1af6ecdc6ed961d17c48527707e3ed9e507946093ee8a004"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4449.0.0-darwin-arm64.tar.gz"
      sha256 "23996982b68fe5dd0b3d7c09b761d62bd23f59979222567e9be4e06307c6c79f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4449.0.0-linux-x64.tar.gz"
    sha256 "95cc2ea504b063d2d2b79dbe0f8c50969bd3122188c91b601964c6aad3c97475"
  end
  version "4449.0.0"
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
