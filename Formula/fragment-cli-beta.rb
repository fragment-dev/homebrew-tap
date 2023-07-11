require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3035.0.0-darwin-x64.tar.gz"
    sha256 "350f752b630db56945e68ce1babafffd187fb696e91e5a8f6a00011619eba767"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3035.0.0-darwin-arm64.tar.gz"
      sha256 "632363842a8d580e3cc447f1b083be059763a06f5f468a9bd9f996682a405062"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3035.0.0-linux-x64.tar.gz"
    sha256 "095d72ffb81fc9be5fa51c9b1a45af7d3bc7c3a8177c7b9ae4d870746d4de534"
  end
  version "3035.0.0"
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
