require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2541.0.0-darwin-x64.tar.gz"
    sha256 "de82529ac8959937c12b734b9befaf835b951ff988e0ff8ed46365894a17fef9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2541.0.0-darwin-arm64.tar.gz"
      sha256 "9163a74e94a1cbbeed95d6cfdd60293598f7cf24fc0507cbacb5f6ed86286da9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2541.0.0-linux-x64.tar.gz"
    sha256 "37a63ad9ec29d29804bd04885af97d7de51b26c506dcd94c6d9085930d22cf23"
  end
  version "2541.0.0"
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
