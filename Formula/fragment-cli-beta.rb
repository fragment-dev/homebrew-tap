require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5040.0.0-darwin-x64.tar.gz"
    sha256 "1fae6467c90e119dd686f4b7e84653e3580d6860fab7a4c3ef5339f33c5a57a8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5040.0.0-darwin-arm64.tar.gz"
      sha256 "43226b3b010c3b30ecff5d818eb1c18c7c257421e7115614ebd51db79b2eb9d6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5040.0.0-linux-x64.tar.gz"
    sha256 "9b6b6a17df1dc40237f580424090bfa8e2189ede553727f5ea3c5f7b3a7e8688"
  end
  version "5040.0.0"
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
