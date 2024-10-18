require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5676.0.0-darwin-x64.tar.gz"
    sha256 "f776e73e3621bc69c9a70f1ef503561d4cad833528719961252a9c5ec745b68f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5676.0.0-darwin-arm64.tar.gz"
      sha256 "df316530a7d49e1c89bf2294b40e4d42d138cd63e05bd89c9c090109a5cf9ebc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5676.0.0-linux-x64.tar.gz"
    sha256 "2b87071ace46fc275502f673ac31bedf1694cf47de63ee14577584796eb76625"
  end
  version "5676.0.0"
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
