require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3906.0.0-darwin-x64.tar.gz"
    sha256 "86112ac9ff70eb9737e8f46e655972c3de536cf50f00395daf89c1117ced2906"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3906.0.0-darwin-arm64.tar.gz"
      sha256 "bfdf6c1a523bd8d0cb4b0bc8a466b1a5190d42cfb644d7521e96b3277e919244"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3906.0.0-linux-x64.tar.gz"
    sha256 "2cf7f2d01bcc946c411d083e192bba440f83d803eb2cc9d0076fd2c9a96a19fa"
  end
  version "3906.0.0"
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
