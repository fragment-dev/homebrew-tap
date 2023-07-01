require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2994.0.0-darwin-x64.tar.gz"
    sha256 "201ef086f2f68c2f5da70222790d464a880812d5ae198d5aa0310c592abfc921"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2994.0.0-darwin-arm64.tar.gz"
      sha256 "0bb28b8685e9c26e30edc393fec1ffa3f8c527b35fd0ba427f2cbfc6562b112f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2994.0.0-linux-x64.tar.gz"
    sha256 "dbf2b6d51672642fc576cc6a6ab53e3c378dd2b02575798515271a90e3adc4d4"
  end
  version "2994.0.0"
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
