require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6647.0.0-darwin-x64.tar.gz"
    sha256 "dd0f0875634f4ff9b697621835d3472131c02fffcc5d3d4a29423eff31bf6b7f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6647.0.0-darwin-arm64.tar.gz"
      sha256 "72893365b003f1b1107deb8f54d24c526fd1d19b38af2080746128be0a06858a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6647.0.0-linux-x64.tar.gz"
    sha256 "16cec232d878066d81b9c50aa3d09ba4d2efb9555a15138917f677420c5435ec"
  end
  version "6647.0.0"
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
