require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3360.0.0-darwin-x64.tar.gz"
    sha256 "7371574815120e50cd833419cb9a59de9cd1f8afb76cb2e52b0745b861004379"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3360.0.0-darwin-arm64.tar.gz"
      sha256 "503500355dc6366269818fb6bd1e55af6392de2aa247557ee06725d1fa6e88fb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3360.0.0-linux-x64.tar.gz"
    sha256 "38f00721fd2edbd8a40432080e3882f07d2fee935661323e60f0b8ef59939e66"
  end
  version "3360.0.0"
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
