require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2843.0.0-darwin-x64.tar.gz"
    sha256 "0f263677e194eb76b37e8fe67f941735012be3e64834794fa23aa64058e46b77"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2843.0.0-darwin-arm64.tar.gz"
      sha256 "be27be79ff58d26a2e1ec26db2335fe3cfdb120e99a0afa32d114e44a7f88424"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2843.0.0-linux-x64.tar.gz"
    sha256 "77699f7cef8a71183db4f929ac4bbc6c725c4544e27789b470417aa2143fab5c"
  end
  version "2843.0.0"
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
