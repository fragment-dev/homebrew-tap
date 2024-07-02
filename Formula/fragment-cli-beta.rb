require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5339.0.0-darwin-x64.tar.gz"
    sha256 "063d81c209297eb9c1c7c8811ec68284d452e1fbb202d8b8d62fa8d124017a4f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5339.0.0-darwin-arm64.tar.gz"
      sha256 "9c21f65e22461a0b00a1bd983fab52246ed8ff30c8ecd8dd89bce3860ea6c18b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5339.0.0-linux-x64.tar.gz"
    sha256 "205dc6f0e4e2a7eca2b6887fba8916402a78652409cc5e973f255da712d972e3"
  end
  version "5339.0.0"
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
