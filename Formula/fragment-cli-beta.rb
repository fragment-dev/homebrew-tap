require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5598.0.0-darwin-x64.tar.gz"
    sha256 "c6f7c3a7426d9c29e6e945eab9c5943ce822c58fe9d764c6d049ab402a945399"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5598.0.0-darwin-arm64.tar.gz"
      sha256 "50aed06be583ed68a3e03403a830b8cc61eb6c3f80326eb0b88a93143fad1422"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5598.0.0-linux-x64.tar.gz"
    sha256 "b2a0b83073fa5c9d586b9995cbf3ac33b407be58321de704ef6fe14777bbd20f"
  end
  version "5598.0.0"
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
