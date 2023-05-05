require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.5-2-darwin-x64.tar.gz"
    sha256 "9b4e6b3d4fd8d78c18bb5ab93e363a2d33863bfbee2bf1a30311edff15a8f09b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.5-2-darwin-arm64.tar.gz"
      sha256 "a4ca0ff0769028aefd68bb38ee59a2fac519909a84e0aab6313e2a9c049b3150"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.5-2-linux-x64.tar.gz"
    sha256 "0c781afe0a90eb4099c08ea6c0ec07a39bb3254848d843634f8a2791ba593597"
  end
  version "2023.5.5-2"
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
