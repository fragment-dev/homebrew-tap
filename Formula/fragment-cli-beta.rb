require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2692.0.0-darwin-x64.tar.gz"
    sha256 "a80353addee06a12c0d32a95f02bbc3d605376d8559e95c490b96681ff68b411"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2692.0.0-darwin-arm64.tar.gz"
      sha256 "82948a29b7caf000d304bf524f4f14e6aead77b0b93fab64c91bc9efccf3cdbc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2692.0.0-linux-x64.tar.gz"
    sha256 "d19ca2778f6999dcc6d73ded6c7c62f5e550e9c70bf2605132ade7330dac1a88"
  end
  version "2692.0.0"
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
