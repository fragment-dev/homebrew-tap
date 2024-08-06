require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5474.0.0-darwin-x64.tar.gz"
    sha256 "2ec0537d3033f2982ed414016083ba1189afa4890188cc7345d1036462ed8fa7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5474.0.0-darwin-arm64.tar.gz"
      sha256 "4d298220016483abb1f6f0eaf76916134698677f556369f29be8fb10e96a1ec1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5474.0.0-linux-x64.tar.gz"
    sha256 "84feff083a32ad576e4fdfb47a3ee542ffa7a572d320c6a9f5202e61e10e278c"
  end
  version "5474.0.0"
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
