require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3836.0.0-darwin-x64.tar.gz"
    sha256 "e6edf849b91667faf7e5a48420df6a2b7d30b3982f4db8c3ccfa37bacf0a5f80"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3836.0.0-darwin-arm64.tar.gz"
      sha256 "bf35f96c779904e57db16ddc3a8e963691a95ab8cc056a06362eda459c925ee1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3836.0.0-linux-x64.tar.gz"
    sha256 "b8194d2647d581723c0150ee2c191de67fd60c8ea89cb8283b505913a5594b14"
  end
  version "3836.0.0"
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
