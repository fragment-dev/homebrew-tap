require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3236.0.0-darwin-x64.tar.gz"
    sha256 "fb1396f5581a170028e62686e832f90e8f5594f17ba6442eba638ab5ef9fd36e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3236.0.0-darwin-arm64.tar.gz"
      sha256 "577a5ee49ae1d0a192f491aff673e56bf9944f2d97d917bf487d88ac3ec0ac35"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3236.0.0-linux-x64.tar.gz"
    sha256 "f11f2c7a509db2b145e0c109416b018e51594d98f95e6a5e44cb8986434afe47"
  end
  version "3236.0.0"
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
