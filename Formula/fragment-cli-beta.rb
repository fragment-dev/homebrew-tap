require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5766.0.0-darwin-x64.tar.gz"
    sha256 "ae6b52a66299634bc3e96adcd8bd9332cf97e9fd5bf0146d207970e9be0f2122"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5766.0.0-darwin-arm64.tar.gz"
      sha256 "85da69743376985a38ad2f61bdc25ed2a2b3e358d58627bb62e757fd33c897b6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5766.0.0-linux-x64.tar.gz"
    sha256 "ed6debd803232b742faf2df8f3757528f180970d76f2fdfdd018fa6a5257cd30"
  end
  version "5766.0.0"
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
