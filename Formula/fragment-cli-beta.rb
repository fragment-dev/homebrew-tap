require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2582.0.0-darwin-x64.tar.gz"
    sha256 "10585bc3a2461b2e62d47fe1252989a9c6d690ab7e0eb55d0bf35cf07bf830c3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2582.0.0-darwin-arm64.tar.gz"
      sha256 "8d66f8f88a0ff279d74c99c69cf84c032709f31e11647036d4806e019cbbb942"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2582.0.0-linux-x64.tar.gz"
    sha256 "b14d22b35149a23742962155b854450ef1c05af07a51c53276fabc7f92957351"
  end
  version "2582.0.0"
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
