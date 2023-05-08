require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2609.0.0-darwin-x64.tar.gz"
    sha256 "fb7acb1b16ecdf95dba69ad34d5c9282cd5366a1e56f6ec8e27bfbaa6bc6ca46"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2609.0.0-darwin-arm64.tar.gz"
      sha256 "de8abb4e9974320214b8e5c8cc9323bd844f8b8a241211e4845c0f640819d3f7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2609.0.0-linux-x64.tar.gz"
    sha256 "38f01a1234ed0fb3047fea69a395f3fe187c3256c6aa1145f61b9dd903efac3d"
  end
  version "2609.0.0"
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
