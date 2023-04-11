require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2405.0.0-darwin-x64.tar.gz"
    sha256 "1bd49f6692bb91ed6ac564029c6ae1eb09cd311661a41bff08bccc0657c5b433"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2405.0.0-darwin-arm64.tar.gz"
      sha256 "a8d3700ec94bf358c98fb990932a72549f79b5591a5399d0cb9e0ce092cf707f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2405.0.0-linux-x64.tar.gz"
    sha256 "9b1e7b50570cc4b30c575f00387d805634116b18aefbc44c862e715fc9560c6e"
  end
  version "2405.0.0"
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
