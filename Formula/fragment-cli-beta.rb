require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4237.0.0-darwin-x64.tar.gz"
    sha256 "d8249a8d692a659f918587ad4f9f2441288a607aeb6a361dd48105e27093f449"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4237.0.0-darwin-arm64.tar.gz"
      sha256 "289e2387fbfcc9edcf0f6d8b76a95f88d43b6286f26642dd50f92b38da5839dc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4237.0.0-linux-x64.tar.gz"
    sha256 "c2840dc06a14de663192b0bad83ac26a2ebcfd40130628cc343bdd7048b15f40"
  end
  version "4237.0.0"
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
