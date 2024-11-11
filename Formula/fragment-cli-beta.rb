require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5758.0.0-darwin-x64.tar.gz"
    sha256 "599e39bcbe78005ae8b350fac594c179c12097934a89551b2ad2ec5764e4aed0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5758.0.0-darwin-arm64.tar.gz"
      sha256 "42561f686fd91dfe0d56e5caf15aca4b3869cd1dcb54ea9f4874749726153d3b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5758.0.0-linux-x64.tar.gz"
    sha256 "ac4b04bb8b14a9efd76fe83544b648db1b0e0f0e3d235e866cc21fe0c6b88239"
  end
  version "5758.0.0"
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
