require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2385.0.0-darwin-x64.tar.gz"
    sha256 "4844be294503095c1facaf0bf1984fe954eac98f3a1de798bfa4bf973feea61f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2385.0.0-darwin-arm64.tar.gz"
      sha256 "ced2515089512e7ce5c1b8a1d70613edf74f189769e29381fcca9487e49c77c1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2385.0.0-linux-x64.tar.gz"
    sha256 "62e51bbf40892877c24964b4c0d12ce8f4d377c39e7552c4fc68944b9e5b9f81"
  end
  version "2385.0.0"
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
