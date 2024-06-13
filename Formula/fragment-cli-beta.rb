require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5269.0.0-darwin-x64.tar.gz"
    sha256 "7662a5a7644e1fdee592f6469913523daa7e9e0b415bcd5561e6f6130c8afb68"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5269.0.0-darwin-arm64.tar.gz"
      sha256 "3070aab6cf586aae054f219c0021605eeac761c7db89912bb5e0b35a167d0cb4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5269.0.0-linux-x64.tar.gz"
    sha256 "70ca24a401b8dbc5069d7d18ea584ef1e93aee4f1b8d0e31283cc0c672867949"
  end
  version "5269.0.0"
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
