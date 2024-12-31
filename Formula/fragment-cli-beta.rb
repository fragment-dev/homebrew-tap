require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6016.0.0-darwin-x64.tar.gz"
    sha256 "743d52861f414c0b2a55c9a050c6eadc523af27bb838d029d404124d4bc554f9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6016.0.0-darwin-arm64.tar.gz"
      sha256 "f6e530d8e72a12040a6340faa5c1b4cef15fe262c15ffc3bd338a82d6caa0bdc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6016.0.0-linux-x64.tar.gz"
    sha256 "cb0d6f3aa1fdc16f41d288586e9704613064f8d7cdcc0dc84001f44a1b4af5ae"
  end
  version "6016.0.0"
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
